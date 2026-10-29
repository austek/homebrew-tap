class Pcaudiolib < Formula
  desc "Portable C Audio Library"
  homepage "https://github.com/espeak-ng/pcaudiolib"
  url "https://github.com/espeak-ng/pcaudiolib/archive/refs/tags/1.3.tar.gz"
  sha256 "86edb75048eec7fcd8d74f9568f051d50b4781982215095b96ba9c2c9c7c159b"
  license "GPL-3.0-only"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "make" => :build
  depends_on "pkg-config" => :build
  depends_on xcode: :build

  def install
    system "./autogen.sh"
    system "./configure", "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "true"
  end
end
