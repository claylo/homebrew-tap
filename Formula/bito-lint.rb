# typed: true
# frozen_string_literal: true

class BitoLint < Formula
  desc "Quality gate tooling for building-in-the-open artifacts"
  homepage "https://github.com/claylo/bito-lint"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/bito-lint/releases/download/v#{version}/bito-lint-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "70b50fd38d4709c48151b680f507cc8513df2d740d50eb46ec07d643b0a7e851"
    else
      url "https://github.com/claylo/bito-lint/releases/download/v#{version}/bito-lint-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "f3754d6ed7d8bf03c4a5a46442f16e569f39bbd1d8d9a6cc288d4ed33b4272cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/bito-lint/releases/download/v#{version}/bito-lint-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7a1676aa471deda1394cb0c1cd4904f4f5e978305eb706a231f79ab998db95fe"
    else
      url "https://github.com/claylo/bito-lint/releases/download/v#{version}/bito-lint-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fbc9ca6ac81b0387e054a169ff5ee97ac6dd1e423cabd47d94f54e24a115ada5"
    end
  end

  def install
    bin.install "bin/bito-lint"
    man1.install Dir["share/man/man1/*.1"]
    bash_completion.install "share/completions/bito-lint.bash" => "bito-lint"
    zsh_completion.install "share/completions/_bito-lint"
    fish_completion.install "share/completions/bito-lint.fish"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/bito-lint info --version-only")
  end
end
