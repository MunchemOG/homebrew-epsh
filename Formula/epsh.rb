class Epsh < Formula
  desc "FTC Robot deployment tool - automate building and deploying Android apps to robots"
  homepage "https://github.com/MunchemOG/epsh"
  url "https://github.com/MunchemOG/ElectroPush/releases/download/v0.0.31/epsh-0.0.31.tar.gz"
  sha256 "388cd02588f26e9e6cbe4d002b94a0e131b3b9067987934c2f761786788f57a4"
  version "0.0.31"

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
