require "formula"

class Mfs < Formula
  homepage "http://www.moosefs.org/"
  url "http://ppa.moosefs.com/src/moosefs-ce-2.0.43-1.tar.gz"
  sha1 "eb82cec7fbc329c43309342a9738be64d90d6ec0"

  option "with-osxfuse", "Use Homebrew's osxfuse for mfsmount"
  depends_on "osxfuse" => :optional

  option "with-pkg-config", "Use pkg-config to find an external osxfuse for mfsmount"
  depends_on "pkg-config" => :optional

  def install
    opoo "WARNING: Not likely to build mfsmount without osxfuse or pkg-config" unless ( build.with? "osxfuse" or build.with? "pkg-config" )

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
