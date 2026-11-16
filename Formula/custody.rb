# typed: true
# frozen_string_literal: true

class Custody < Formula
  desc "Deterministic evidence validation for LLM summaries of PDF sources"
  homepage "https://github.com/claylo/custody"
  version "0.1.0"
  license "Apache-2.0 OR MIT"

  # Hard runtime requirements; `custody doctor` enforces MuPDF >=1.28,<1.29
  # and Tesseract >=5.5,<5.6.
  depends_on "mupdf"
  depends_on "tesseract"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/custody/releases/download/v0.1.0/custody-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c0208d96ae76b1fc862e2c4822140e43706769af8c1479b6f7f1058140ee5b12"
    else
      url "https://github.com/claylo/custody/releases/download/v0.1.0/custody-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "06b3547c26190197b45b4ba2653037747804029aef0e5ea4cba3aa36e7c38420"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/custody/releases/download/v0.1.0/custody-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a36f681ecf65c8a0391fa89bd88e17b35c155345b5ffa6ec356d7e572ce4fa90"
    else
      url "https://github.com/claylo/custody/releases/download/v0.1.0/custody-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb5cfb823d875754d24325cdf3f6f3a927129ef1a4366e5acbf3962631771512"
    end
  end

  # man pages and completions are rendered by `cargo xtask` in cd.yml, from
  # the same librebar command tree the binary parses.
  def install
    bin.install "bin/custody"
    man1.install Dir["share/man/man1/*.1"]
    bash_completion.install "share/completions/custody.bash" => "custody"
    zsh_completion.install "share/completions/_custody"
    fish_completion.install "share/completions/custody.fish"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/custody --version-only")
  end
end
