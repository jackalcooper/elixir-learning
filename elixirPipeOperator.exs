# 下列语句可以改写成

s = File.stat(fname)
t = elem(s, 1)
m = Map.from_struct(t)
sizeToMB = m[:size]/1024/1024

sizeToMB = File.stat(fname)
            |> elem(s, 1)
            |> Map.from_struct(t)
