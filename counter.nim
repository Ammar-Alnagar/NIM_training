import std/os
import std/times

let startTime = cpuTime()
for i in 1..1_000_000_000:
  discard
let endTime = cpuTime()
let duration = endTime - startTime
echo "Time taken: ", duration, " seconds"
echo "Done counting to 1,000,000"

echo("hellow world from nim")