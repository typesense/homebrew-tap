# typed: true
# frozen_string_literal: true

require "English"

versions = %w[
  0.25.0
  0.24.1
  0.24.0
  0.23.1
  0.23.0
  0.22.2
  0.22.1
  0.22.0
  0.21.0
  0.20.0
  0.19.0
  0.18.0
  0.17.0
  0.16.1
  0.16.0
  0.15.0
  0.14.0
  0.13.0
  0.12.0
]

versions.each do |version|
  puts "Creating formula for version #{version}"
  file_name = "typesense-server-#{version}-darwin-amd64.tar.gz"
  file_path = "/tmp"
  full_file_path_name = "#{file_path}/#{file_name}"
  file_download_url = "https://dl.typesense.org/releases/#{version}/#{file_name}"

  puts "Downloading #{version} binary"
  `curl -s --fail-with-body "#{file_download_url}" --output "#{full_file_path_name}"`
  raise "curl failed with exit code #{$CHILD_STATUS.exitstatus}" unless $CHILD_STATUS.success?

  puts "Calculating sha256 hash for #{version} binary"
  file_sha256 = `sha2 -256 -q #{full_file_path_name}`
  # sha2 returns a non-zero error code for some reason, so commenting this out
  # raise "sha2 failed with exit code #{$CHILD_STATUS.exitstatus}" unless $CHILD_STATUS.success?

  formula = <<~EOFORMULA
    class TypesenseServerAT#{version.delete(".")} < Formula
      desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
      homepage "https://typesense.org"
      url "#{file_download_url}"
      version "#{version}"
      sha256 "#{file_sha256.strip}"
      license "GPL-3.0"

      def install
        bin.install "typesense-server"

        # Create directories
        [data_dir, config_dir, log_dir].each(&:mkpath)

        # Create default config file
        config_file_contents = <<~EOF
          [server]
          api-address = 0.0.0.0
          api-port = 8108
          api-key = xyz
          data-dir = \#{data_dir}
          log-dir = \#{log_dir}
          enable-cors = true
        EOF
        system "echo '\#{config_file_contents}' > \#{buildpath/"typesense.ini"}"
        config_dir.install "typesense.ini"
      end

      def caveats
        msg = <<~EOS
          * The default admin API key is xyz
            The default API port is 8108
                You can change these and other configuration by editing \#{config_dir/"typesense.ini"}
          * Logs are under: \#{log_dir}
          * Data dir is under: \#{data_dir}
          * To test that Typesense is running, try
                curl http://localhost:8108/health
        EOS

        if OS.mac?
          if Hardware::CPU.intel? && MacOS.version < :ventura
            msg = <<~EOS
              \#{msg}
              *************************************************************************************************
              * NOTE: The macOS Intel build of Typesense is only supported on macOS Venture (13.x) or above.
              *  For other macOS versions, please use the Docker installation method described here:
              *    https://typesense.org/docs/guide/install-typesense.html#docker
              *************************************************************************************************
            EOS
          elsif Hardware::CPU.arm?
            msg = <<~EOS
              \#{msg}
              ************************************************************************************************************
              * NOTE: The macOS build of Typesense is only supported natively on Apple machines with Intel CPUs.
              *  If you run this build on Apple M1/M2, macOS will use Rosetta which will affect Typesense's performance.
              *  For Apple M1/M2 machines, please use the Docker installation method described here:
              *     https://typesense.org/docs/guide/install-typesense.html#docker
              ************************************************************************************************************
            EOS
          end
        end

        msg
      end

      service do
        run [opt_bin/"typesense-server", "--config=\#{etc/"typesense/typesense.ini"}"]
        keep_alive true
        error_log_path var/"log/typesense.log"
        log_path var/"log/typesense.log"
        working_dir var/"lib/typesense"
      end

      def config_dir
        etc/"typesense"
      end

      def data_dir
        var/"lib/typesense"
      end

      def log_dir
        var/"log/typesense"
      end

      test do
        output = shell_output("\#{bin}/typesense-server 2>&1", 1)
        assert_match "Command line usage: ./typesense-server", output
      end
    end
  EOFORMULA

  puts "Upserting Formula/typesense-server@#{version}.rb"
  File.write("Formula/typesense-server@#{version}.rb", formula)

  puts "---"
end

puts "Updating symlink for typesense-server to point to #{versions.first}"
`ln -sf ../Formula/typesense-server@#{versions.first}.rb Aliases/typesense-server`

puts "Done"
