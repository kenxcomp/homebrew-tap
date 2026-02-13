class Kenotex < Formula
  desc "Vim-style TUI note-taking app with smart distribution to Reminders, Calendar, and Notes"
  homepage "https://github.com/kenxcomp/kenotex"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kenxcomp/kenotex/releases/download/v1.1.0/kenotex-aarch64-apple-darwin.tar.gz"
      sha256 "45dff8f0a5744f765c9b971a0b530a68299285ab5377f536be60f9d886fec66f"
    elsif Hardware::CPU.intel?
      url "https://github.com/kenxcomp/kenotex/releases/download/v1.1.0/kenotex-x86_64-apple-darwin.tar.gz"
      sha256 "d0c2cfedf7a991f9fc81572458512b4da593f1cd679f15374e5edbe1ecec876e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kenxcomp/kenotex/releases/download/v1.1.0/kenotex-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "29f6b3b71b1126c3e2ff31ef5ff6cfcea71ff834574e3c8d149760d2bdeac000"
    elsif Hardware::CPU.intel?
      url "https://github.com/kenxcomp/kenotex/releases/download/v1.1.0/kenotex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5af41dc3c39b341cc597e39e3cf579c1eb847dc3f113b306ac91d02178cfc872"
    end
  end

  def install
    bin.install "kenotex"
  end

  test do
    assert_match "kenotex #{version}", shell_output("#{bin}/kenotex --version")
  end
end
