# typed: true
# frozen_string_literal: true

class __CLASS__ < Formula
  desc "__DESC__"
  homepage "https://github.com/claylo/__NAME__"
  url "https://github.com/claylo/__NAME__/archive/refs/tags/v0.0.0.tar.gz"
  sha256 "placeholder"
  license "__LICENSE__"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/__NAME__ --version")
  end
end
