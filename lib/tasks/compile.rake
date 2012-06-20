namespace :compile do
  task :mediainfo do
    url = "http://downloads.sourceforge.net/project/mediainfo/binary/mediainfo/0.7.58/MediaInfo_CLI_0.7.58_GNU_FromSource.tar.bz2?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fmediainfo%2Ffiles%2Fbinary%2Fmediainfo%2F0.7.58%2FMediaInfo_CLI_0.7.58_GNU_FromSource.tar.bz2%2Fdownload&ts=1340119295&use_mirror=voxel"
    `mkdir -p tmp`
    `wget -O tmp/mediainfo.tar.bz2 "#{url}"`
    `cd tmp && tar xvf mediainfo.tar.bz2`
    `cd tmp/MediaInfo_CLI_GNU_FromSource && sh CLI_Compile.sh > CLI_Compile.log`
    `mkdir -p ext`
    `mv tmp/MediaInfo_CLI_GNU_FromSource/MediaInfo/Project/GNU/CLI/mediainfo ext/`

    # clean up
    `rm -rf tmp/mediainfo.tar.bz2 tmp/MediaInfo_CLI_GNU_FromSource`
  end
end