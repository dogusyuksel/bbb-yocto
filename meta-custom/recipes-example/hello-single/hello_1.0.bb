DESCRIPTION = "Simple helloworld example in C"
LICENSE = "CLOSED"

SRC_URI = "file://helloworld.c"

S = "${WORKDIR}"

do_compile() {
	${CC} ${LDFLAGS} helloworld.c -o helloworld
}

do_install() {
	install -d ${D}${bindir}
	install -m 0755 ${S}/helloworld ${D}${bindir}
}
