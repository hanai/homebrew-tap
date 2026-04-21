class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "0.3.0-snapshot.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.1/agent-helper-macos-arm64.tar.gz"
      sha256 "6c4a5d0c4c24d68430c3069070085b5db2fe1a04f81903538cfee764760479a2"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.1/agent-helper-linux-amd64.tar.gz"
      sha256 "a702d654159f10847adc5790a9595f9d6b5e828b73977eda8045b8d117ef1ec3"
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
