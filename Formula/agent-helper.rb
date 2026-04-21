class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.2.0/agent-helper-macos-arm64.tar.gz"
      sha256 "66527b5cc969395f18dce3e7366995059f1c01cb848ce3241711fbec6ff9304b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.2.0/agent-helper-linux-amd64.tar.gz"
      sha256 "0b7ff03e1e22ee53868f33d29ec2f31147402277c43aeeca160fb1d706f2517b"
    end
  end

  def install
    bin.install "agent-helper"
  end

  test do
    system "#{bin}/agent-helper", "--help"
  end
end
