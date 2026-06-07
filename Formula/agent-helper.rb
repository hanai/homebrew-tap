class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.1-snapshot.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.16/agent-helper-macos-arm64.tar.gz"
      sha256 "46e796b7fc42480c18765541a67f0e741ab2f43c17fd1b97390b6a730e04deee"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.16/agent-helper-linux-amd64.tar.gz"
      sha256 "ff76149db89e6e48c467b8a52a9257f0fc6f7fa3f19a7ba733287adc40d0f149"
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
