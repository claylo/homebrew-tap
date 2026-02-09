# typed: true
# frozen_string_literal: true

class BitoLint < Formula
  desc "Quality gate tooling for building-in-the-open artifacts"
  homepage "https://github.com/claylo/bito-lint"
  url "https://github.com/claylo/bito-lint/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "d7fc4ec7b48d4e76526fb363850182edc87c8f4f4df52d14b2b9ca0b568d73c5"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/bito-lint")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bito-lint info --version-only")
  end
end
