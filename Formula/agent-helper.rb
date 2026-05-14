class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.1-snapshot.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.6/agent-helper-macos-arm64.tar.gz"
      sha256 "c08a9f0eabc24da076c6b0e1b7f2e6cea5ab40ffa4f1cdc992406dff57c2cbb4"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.6/agent-helper-linux-amd64.tar.gz"
      sha256 "11eed4b5d159a7ffba89a99205fbecb2bb41733a2ed4eabaf9bd152e3f6e42cd"
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
