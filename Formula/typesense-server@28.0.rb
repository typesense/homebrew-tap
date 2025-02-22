class TypesenseServerAT280 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  version "28.0"
  license "GPL-3.0"

  if Hardware::CPU.arm?
    url "https://dl.typesense.org/releases/28.0/typesense-server-28.0-darwin-arm64.tar.gz"
    sha256 "90e8cede4a249af697af9e707102946e8633cd349a17d61efad63f03884dbec6"
  else
    url "https://dl.typesense.org/releases/28.0/typesense-server-28.0-darwin-amd64.tar.gz"
    sha256 "a3e89537913c7a69cd983ef60edaf3108daa7b9ec1bd7489c8904d0e0146b925"
  end

  def install
    bin.install "typesense-server"

    # Create directories
    [data_dir, config_dir, log_dir, analytics_dir].each(&:mkpath)

    # Create default config file
    config_file_contents = <<~EOF
      [server]
      api-address = 0.0.0.0
      api-port = 8108
      api-key = xyz
      data-dir = #{data_dir}
      log-dir = #{log_dir}
      enable-search-analytics = true
      analytics-flush-interval = 60
      analytics-dir = #{analytics_dir}
      enable-cors = true
    EOF
    system "echo '#{config_file_contents}' > #{buildpath/"typesense.ini"}"
    config_dir.install "typesense.ini"
  end

  def caveats
    msg = <<~EOS
      * The default admin API key is xyz
      * The default API port is 8108
      * Config file is at: #{config_dir/"typesense.ini"}
      * Logs are under: #{log_dir}
      * Data dir is under: #{data_dir}
      * To test that Typesense is running, try running curl http://localhost:8108/health
    EOS

    on_macos do
      if MacOS.version < :ventura
        msg = <<~EOS
          #{msg}
          *************************************************************************************************
          * NOTE: The macOS Intel build of Typesense is only supported on macOS Venture (13.x) or above.
          *  For other macOS versions, please use the Docker installation method described here:
          *    https://typesense.org/docs/guide/install-typesense.html#docker
          *************************************************************************************************
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

  def analytics_dir
    var/"lib/typesense/analytics"
  end

  def log_dir
    var/"log/typesense"
  end

  test do
    output = shell_output("#{bin}/typesense-server 2>&1", 1)
    assert_match "Command line usage: ./typesense-server", output
  end
end
