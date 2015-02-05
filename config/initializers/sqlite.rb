if ::ActiveRecord::Base.connection_config[:adapter] == 'sqlite3'
  if c = ::ActiveRecord::Base.connection
    # see http://www.sqlite.org/pragma.html for details

    # Page size of the database. The page size must be a power of two between 512 and 65536 inclusive
    c.execute 'PRAGMA main.page_size=4096;'

    # Suggested maximum number of database disk pages that SQLite will hold in memory at once per open database file
    c.execute 'PRAGMA main.cache_size=10000;'

    # Database connection locking-mode. The locking-mode is either NORMAL or EXCLUSIVE
    c.execute 'PRAGMA main.locking_mode=EXCLUSIVE;'

    # Setting of the "synchronous" flag, "NORMAL" means sync less often but still more than none
    c.execute 'PRAGMA main.synchronous=NORMAL;'

    # Journal mode for database, WAL=write-ahead log
    c.execute 'PRAGMA main.journal_mode=WAL;'

    # Storage location for temporary tables, indices, views, triggers
    c.execute 'PRAGMA main.temp_store = MEMORY;'
  end
end 
