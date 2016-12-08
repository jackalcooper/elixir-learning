# 找出给定目录中 50MB 及以上的所有文件（含所有子目录），存入列表，并打印该列表。

# 检查目录路径是否有效的函数, 若无效则重新输入

defmodule Validatepath do
  def check_path(theFolder) do
    case File.dir?(theFolder) do
      true -> theFolder
      false ->
        theFolder = String.trim_trailing (IO.gets "Please input a right path.\n")
        check_path(theFolder)
    end
  end
end

# 遍历目录下所有文件及文件夹（包括子目录文件）

defmodule WalkDirectory do

  def the_file_list(theFolder) do
    File.ls(theFolder)
      |> elem(1)
      |> Enum.map(&Path.join(["#{theFolder}", "#{&1}"]))
  end

  def the_file_path_list(theFolder) do
    the_file_list(theFolder)
      |> Enum.map(
          fn fname ->
            case File.dir?(fname) do
              false -> fname
              true -> the_file_path_list(fname)
            end
          end
         )
      |> List.flatten
  end

end


# 检查是否大于等于 50m 的函数

defmodule CheckSize do
  def is_50m_plus do
    m = File.stat(fname)
        |> elem(1)
        |> Map.from_struct()
    m[:size]/1000/1000 >= 50
  end
end

# 获取所有文件的路径列表

IO.gets "This program will help you find the paths of all the files ≥ 50MB in a specific folder. Please input the path of the folder.\n"
  |> String.trim_trailing
  |> Validatepath.check_path
  |> WalkDirectory.the_file_path_list
  |> Enum.filter(&CheckSize.is_50m_plus(&1))
  |> Enum.each(&IO.puts(&1))
