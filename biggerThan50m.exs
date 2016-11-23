# 找出给定目录中 50MB 及以上的所有文件（含所有子目录），存入列表，并打印该列表。

# 获取目录的路径

theFolder = String.trim_trailing (
  IO.gets "This program will help you find the paths of all the files ≥ 50MB in a specific folder. Please input the path of the folder.\n" # 输入目录路径
) # 删掉路径后面的换行符

# 检查目录路径是否有效的函数, 若无效则重新输入

defmodule Validatepath do
  def check_path(theFolder) do
    unless File.dir?(theFolder) do
      theFolder = String.trim_trailing (
        IO.gets "Please input a right path.\n" # 再次输入目录路径
      )
      check_path(theFolder)
    else
      theFolder # 这句我为了让函数返回新输入的路径值, 似乎能解决问题, 但感觉应该有更好的实现方式
    end
  end
end

# 遍历目录下所有文件及文件夹（包括子目录文件）

defmodule WalkDirectory do
  def the_file_path_list(theFolder) do
    theDir = File.ls(theFolder)
    theDirList = elem(theDir, 1)
    Enum.map(theDirList, fn(fname) ->
      fname = Path.join(["#{theFolder}", "#{fname}"])
      if File.dir?(fname) do
        the_file_path_list(fname)
      else
        fname
      end
    end)
  end
end

# 检查是否大于等于 50m 的函数
is_50m_plus = fn (fname) ->
  m = File.stat(fname)
        |> elem(1)
        |> Map.from_struct
  sizeToMB = m[:size]/1024/1024
  sizeToMB >= 50
end

theList = Validatepath.check_path(theFolder) # 确定获取的是正确的路径
            |> WalkDirectory.the_file_path_list # 获取文件列表
            |> List.flatten # 把 List 打平

find50mPlusList = for x <- theList, is_50m_plus.(x), do: x # 获取大于等于 50M 的文件列表

Enum.each(find50mPlusList, fn(filePath) -> IO.puts(filePath) end) # 打印列表

# EOF
