class EspeakNg < Formula
  desc "Multi-lingual software speech synthesizer"
  homepage "https://github.com/espeak-ng/espeak-ng"
  url "https://github.com/espeak-ng/espeak-ng/archive/refs/tags/1.52.0.tar.gz"
  sha256 "bb4338102ff3b49a81423da8a1a158b420124b055b60fa76cfb4b18677130a23"
  license "GPL-3.0-only"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "make" => :build
  depends_on "pcaudiolib" => :build
  depends_on "pkg-config" => :build
  depends_on xcode: :build

  patch do
    url "https://raw.githubusercontent.com/austek/formula-patches/e3cb416/espeak-ng/1.51.1.patch"
    sha256 "89c44b882558134ba1c55b599e30660340984afe178ba9fd69ecd271afe449d0"
  end

  def install
    mv "CHANGELOG.md", "ChangeLo.md"
    mv "ChangeLo.md", "ChangeLog.md"
    system "./autogen.sh"
    system "./configure", "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    assert_equal "h@l'oU\n", pipe_output("#{bin}/espeak-ng -qx hello")
  end
end
