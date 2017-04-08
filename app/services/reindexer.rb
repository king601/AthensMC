# Reindexer
#
# Reindexes models which are setup with SearchKick
class Reindexer
  def self.execute
    ForumThread.reindex
    User.reindex
  end
end
