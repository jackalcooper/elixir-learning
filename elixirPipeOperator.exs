# 下列语句

s = File.stat(fname)
t = elem(s, 1)
m = Map.from_struct(t)

# 可以改写成

m = File.stat
    |> elem(1)
    |> Map.from_struct
