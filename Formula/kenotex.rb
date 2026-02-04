class Kenotex < Formula
  desc "Vim-style TUI note-taking app with smart distribution to Reminders, Calendar, and Notes"
  homepage "https://github.com/kenxcomp/kenotex"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kenxcomp/kenotex/releases/download/v0.1.0/kenotex-aarch64-apple-darwin.tar.gz"
      sha256 "3a8d65cf798c5658d65544847af3aecdacc5a4671246857976c5926693c9e91f"
    elsif Hardware::CPU.intel?
      url "https://github.com/kenxcomp/kenotex/releases/download/v0.1.0/kenotex-x86_64-apple-darwin.tar.gz"
      sha256 "acff1347cbbfe45c664b0ce93a6ae557f16ac2838781ba7767ac0400ae667550"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kenxcomp/kenotex/releases/download/v0.1.0/kenotex-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e2a06dc7393b40e32c2fbe20facd41fbaa95d5af345e96e526faad607176db1e"
    elsif Hardware::CPU.intel?
      url "https://github.com/kenxcomp/kenotex/releases/download/v0.1.0/kenotex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d23705cb32cc2c61fd4c78b1693370e1bf803430ea6a6d90d896a5d4d56ef613"
    end
  end

  def install
    bin.install "kenotex"
  end

  test do
    assert_match "kenotex #{version}", shell_output("#{bin}/kenotex --version")
  end
end
