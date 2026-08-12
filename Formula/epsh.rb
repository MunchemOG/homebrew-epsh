class Epsh < Formula
  desc "FTC Robot deployment tool - automate building and deploying Android apps to robots"
  homepage "https://github.com/MunchemOG/epsh"
  url "https://github.com/MunchemOG/ElectroPush/releases/download/v0.0.3/epsh-0.0.3.tar.gz"
  sha256 "5dbd551d6c3958f9a3b140537f413d59bcc08c9bfe48c06030447c2b73d6f27d"
  version "0.0.3"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  def caveats
    <<~EOS
      ElectroPush requires ADB (Android Debug Bridge) to be installed.
      Install it with:
        brew install android-platform-tools

      Run 'epsh help' to get started.
    EOS
  end

  test do
    assert_match "FTC Robot Deployment Tool", shell_output("#{bin}/epsh help")
  end
end
