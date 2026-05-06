class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "0.3.0-snapshot.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.9/agent-helper-macos-arm64.tar.gz"
      sha256 "6ecfc68b91488016614d1074d21cdee49043de283d0d16677ac89c191104c1cc"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.9/agent-helper-linux-amd64.tar.gz"
      sha256 "4fa5888fa9f962b390a45c97adf1a2b9ec91b474f366c9ae2b488ef510b2d502"
    else
      odie "agent-helper does not support Linux ARM"
    end
  end

  def install
    bin.install "agent-helper"
  end

  test do
    system "#{bin}/agent-helper", "--help"
  end
end
