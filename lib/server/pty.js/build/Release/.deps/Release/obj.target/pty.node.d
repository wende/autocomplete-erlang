cmd_Release/obj.target/pty.node := flock ./Release/linker.lock g++ -shared -pthread -rdynamic -m64  -Wl,-soname=pty.node -o Release/obj.target/pty.node -Wl,--start-group Release/obj.target/pty/src/unix/pty.o -Wl,--end-group -lutil -L/usr/lib -L/usr/local/lib