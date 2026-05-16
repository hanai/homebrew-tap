class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.1-snapshot.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.8/agent-helper-macos-arm64.tar.gz"
      sha256 "d925ecbbe88576d0dfa53a48463922c352a5adc02ed5bfc38573752b01816e9e"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.8/agent-helper-linux-amd64.tar.gz"
      sha256 "8e76cf47269b0f87552d4935611fbcb285c896ecb67873a4168e0f79220a422f"
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
