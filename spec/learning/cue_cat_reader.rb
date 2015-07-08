# This test shows us that cue cat behaves like a keyboard device - type on the
# keyboard, then press ENTER. The programme eacho each line it reads to
# standard out

# To test-drive this behaviour, it looks like we can simulate standard in
loop {
 lines = STDIN.gets
 puts lines
}