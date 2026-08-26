class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.6/aura-darwin-arm64"
      sha256 "4aa1e585dc8f2637a5713a0aeff95572c715e37cab3d35d60360b19fe97a0339"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.6/aura-darwin-amd64"
      sha256 "006952b1be2a6e89092b54a74618a3defa293f2c63044182848269cf960fa624"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.6/aura-linux-arm64"
      sha256 "7f84e5e3d353f0c21955ac24ac91d74fc30fce040742c53617ebf146774a0d8b"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.6/aura-linux-amd64"
      sha256 "3370250d5750fc4afb7c7fc6df0bcf17a788c23f77c90eff522b763f2e7b2eff"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    source = "aura-#{os}-#{arch}"

    chmod 0755, source
    bin.install source => "aura"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aura --version")
  end
end
