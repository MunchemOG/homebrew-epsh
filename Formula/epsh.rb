class Epsh < Formula
  desc "FTC Robot deployment tool - automate building and deploying Android apps to robots"
  homepage "https://github.com/MunchemOG/epsh"
  url "https://github.com/MunchemOG/ElectroPush/releases/download/v0.0.4/epsh-0.0.4.tar.gz"
  sha256 "c8512cfae3aa47eae868d9fdb56d691924d3b946f54e190c2a7f2944c62eb390"
  version "0.0.4"

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
