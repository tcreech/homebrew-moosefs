require "formula"

class Mfs < Formula
  homepage "http://www.moosefs.org/"
  url "http://ppa.moosefs.com/src/moosefs-ce-2.0.43-1.tar.gz"
  sha1 "eb82cec7fbc329c43309342a9738be64d90d6ec0"

  depends_on "osxfuse" => :optional

  def install

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--sysconfdir=#{HOMEBREW_PREFIX}/etc"

    system "make", "install"
  end

  test do
    system "#{sbin}/mfschunkserver -v"
  end
end
