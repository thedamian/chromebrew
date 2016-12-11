require 'package'

class Pcre < Package
  version '8.39'
  source_url 'http://downloads.sourceforge.net/pcre/pcre-8.39.tar.bz2'
  source_sha1 '5e38289fd1b4ef3e8426f31a01e34b6924d80b90'

  depends_on 'buildessential'

  def self.build
    system "./configure --prefix=/usr/local  --enable-unicode-properties  --enable-pcre16 --enable-pcre32 --enable-pcregrep-libz  --enable-pcregrep-libbz2 --enable-pcretest-libreadline --disable-static"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
    #system "mv -v /usr/lib/libpcre.so.* /lib "
    #system "ln -sfv ../../lib/$(readlink /usr/lib/libpcre.so) /usr/lib/libpcre.so"
  end
end
