class TypesenseServerAT0150 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  url "https://dl.typesense.org/releases/0.15.0/typesense-server-0.15.0-darwin-amd64.tar.gz"
  version "0.15.0"
  sha256 "39fe7ba938ed2951930ec6efc9a58aebceac711de1a20ffd488da7ce8ccf16a5"
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
      data-dir = #{data_dir}
      log-dir = #{log_dir}
      enable-cors = true
    EOF
    system "echo '#{config_file_contents}' > #{buildpath/"typesense.ini"}"
    config_dir.install "typesense.ini"
  end

  def caveats
    msg = <<~EOS
      * The default admin API key is xyz
        The default API port is 8108
            You can change these and other configuration by editing #{config_dir/"typesense.ini"}
      * Logs are under: #{log_dir}
      * Data dir is under: #{data_dir}
      * To test that Typesense is running, try
            curl http://localhost:8108/health
    EOS

    if OS.mac?
      if Hardware::CPU.intel? && MacOS.version < :ventura
        msg = <<~EOS
          #{msg}
          *************************************************************************************************
          * NOTE: The macOS Intel build of Typesense is only supported on macOS Venture (13.x) or above.
          *  For other macOS versions, please use the Docker installation method described here:
          *    https://typesense.org/docs/guide/install-typesense.html#docker
          *************************************************************************************************
        EOS
      elsif Hardware::CPU.arm?
        msg = <<~EOS
          #{msg}
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
    run [opt_bin/"typesense-server", "--config=#{etc/"typesense/typesense.ini"}"]
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
    output = shell_output("#{bin}/typesense-server 2>&1", 1)
    assert_match "Command line usage: ./typesense-server", output
  end
end
