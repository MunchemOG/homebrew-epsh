class Epsh < Formula
  desc "FTC Robot deployment tool - automate building and deploying Android apps to robots"
  homepage "https://github.com/MunchemOG/epsh"
  url "https://github.com/MunchemOG/epsh/archive/v1.0.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  version "1.0.0"

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
