import
  json,
  logging,
  math,
  os,
  osproc,
  sequtils,
  streams,
  strformat,
  strutils,
  sugar,
  tables,
  times

let
  word_count = 1000 * 1000
  expected = $(word_count)
  tags = commandLineParams()
  runs = 50
  words = toSeq(1..word_count).join("\n") & "\n"
  logger = newConsoleLogger(useStderr = true)

addHandler(logger)

proc time(tag: string): int =
  let
    start = epochTime()
    p = startProcess(
        "/usr/local/bin/docker",
        args = ["run", "-i", "--rm", &"wc:{tag}"]
    )

  p.inputStream.write(words)
  p.inputStream.flush()
  p.inputStream.close()

  let
    actual = p.outputStream.readAll().strip()
    exit_code = p.waitForExit()
    time_taken = round((epochTime() - start) * 1000).int

  if(actual != expected):
    raise newException(
        Exception,
        &"received invalid result for {tag}: {actual}"
    )

  if(exit_code != 0):
    raise newException(
        Exception,
        &"bad exit code for {tag}: {exit_code}"
    )

  time_taken

var stats = initOrderedTable[string, int]()

for tag in tags:
  notice("profiling ", tag)
  stats[tag] = toSeq(1..runs).map(_ => tag.time()).foldl(min(a, b))

echo pretty(%*stats)
