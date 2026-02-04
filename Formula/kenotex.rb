class Kenotex < Formula
  desc "Vim-style TUI note-taking app with smart distribution to Reminders, Calendar, and Notes"
  homepage "https://github.com/kenxcomp/kenotex"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kenxcomp/kenotex/releases/download/v0.1.0/kenotex-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    elsif Hardware::CPU.intel?
      url "https://github.com/kenxcomp/kenotex/releases/download/v0.1.0/kenotex-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kenxcomp/kenotex/releases/download/v0.1.0/kenotex-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER"
    elsif Hardware::CPU.intel?
      url "https://github.com/kenxcomp/kenotex/releases/download/v0.1.0/kenotex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "kenotex"
  end

  test do
    assert_match "kenotex #{version}", shell_output("#{bin}/kenotex --version")
  end
end
