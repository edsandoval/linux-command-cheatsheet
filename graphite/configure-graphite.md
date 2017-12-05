# Increase the data retention period from the default of 1day to 14days

The retention period is stored in the following configuration file:

<pre>
vi /opt/graphite/conf/storage-schemas.conf
</pre>

The default configuration has the following settings:

<pre>
[default_1min_for_1day]
pattern = .*
retentions = 60s:1d
</pre>

To change to store for 14 days, change the settings to the following:

<pre>
[default_1min_for_1day]
pattern = .*
retentions = 60s:14d
</pre>

* Any existing metrics created will not automatically adopt the new schema. You must use whisper-resize.py to modify the metrics to the new schema. The other option is to delete existing whisper files (/opt/graphite/storage/whisper) and restart carbon-cache.py for the files to get recreated again.

* Restart of carbon-cache.py is required after making the change.
