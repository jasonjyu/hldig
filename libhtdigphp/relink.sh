#!/bin/sh


#LIBHTDIG_LIBRARY = libhtdig.so.3.2
LIBHTDIG_VER='3.2.0'

set -x


gcc -g -I. -I/nfs/users/rnw/nealr/code/htdig/htdig-CVS-linux/libhtdigphp/ -I/nfs/users/rnw/nealr/code/htdig/htdig-CVS-linux/libhtdigphp/main -I/nfs/users/rnw/nealr/code/htdig/htdig-CVS-linux/libhtdigphp -I../libhtdig -I/nfs/local/linux/include/php4 -I/nfs/local/linux/include/php4/main -I/nfs/local/linux/include/php4/Zend -I/nfs/local/linux/include/php4/TSRM -I/usr/local/include -DHAVE_CONFIG_H -c htdigphp.c  -fPIC -DPIC -o htdigphp.lo

#relink with all objects from linhtdig.so
LIBHTDIG_OBJS=' ../libhtdig/bt_compare.o ../libhtdig/bt_conv.o ../libhtdig/bt_curadj.o ../libhtdig/bt_cursor.o ../libhtdig/bt_delete.o ../libhtdig/bt_method.o ../libhtdig/bt_open.o ../libhtdig/bt_put.o ../libhtdig/bt_rec.o ../libhtdig/bt_reclaim.o ../libhtdig/bt_recno.o ../libhtdig/bt_rsearch.o ../libhtdig/bt_search.o ../libhtdig/bt_split.o ../libhtdig/bt_stat.o ../libhtdig/bt_upgrade.o ../libhtdig/btree_auto.o ../libhtdig/crdel_auto.o ../libhtdig/crdel_rec.o ../libhtdig/db.o ../libhtdig/db_am.o ../libhtdig/db_auto.o ../libhtdig/db_byteorder.o ../libhtdig/db_conv.o ../libhtdig/db_dispatch.o ../libhtdig/db_dup.o ../libhtdig/db_err.o ../libhtdig/db_getlong.o ../libhtdig/db_iface.o ../libhtdig/db_join.o ../libhtdig/db_log2.o ../libhtdig/db_meta.o ../libhtdig/db_method.o ../libhtdig/db_overflow.o ../libhtdig/db_pr.o ../libhtdig/db_rec.o ../libhtdig/db_reclaim.o ../libhtdig/db_ret.o ../libhtdig/db_salloc.o ../libhtdig/db_shash.o ../libhtdig/db_upgrade.o ../libhtdig/env_method.o ../libhtdig/env_open.o ../libhtdig/env_recover.o ../libhtdig/env_region.o ../libhtdig/hash.o ../libhtdig/hash_auto.o ../libhtdig/hash_conv.o ../libhtdig/hash_dup.o ../libhtdig/hash_func.o ../libhtdig/hash_meta.o ../libhtdig/hash_method.o ../libhtdig/hash_page.o ../libhtdig/hash_rec.o ../libhtdig/hash_reclaim.o ../libhtdig/hash_stat.o ../libhtdig/hash_upgrade.o ../libhtdig/lock.o ../libhtdig/lock_conflict.o ../libhtdig/lock_deadlock.o ../libhtdig/lock_region.o ../libhtdig/lock_util.o ../libhtdig/log.o ../libhtdig/log_archive.o ../libhtdig/log_auto.o ../libhtdig/log_compare.o ../libhtdig/log_findckp.o ../libhtdig/log_get.o ../libhtdig/log_method.o ../libhtdig/log_put.o ../libhtdig/log_rec.o ../libhtdig/log_register.o ../libhtdig/mp_alloc.o ../libhtdig/mp_bh.o ../libhtdig/mp_cmpr.o ../libhtdig/mp_fget.o ../libhtdig/mp_fopen.o ../libhtdig/mp_fput.o ../libhtdig/mp_fset.o ../libhtdig/mp_method.o ../libhtdig/mp_region.o ../libhtdig/mp_register.o ../libhtdig/mp_stat.o ../libhtdig/mp_sync.o ../libhtdig/mp_trickle.o ../libhtdig/mut_fcntl.o ../libhtdig/mut_pthread.o ../libhtdig/mut_tas.o ../libhtdig/mutex.o ../libhtdig/os_abs.o ../libhtdig/os_alloc.o ../libhtdig/os_dir.o ../libhtdig/os_errno.o ../libhtdig/os_fid.o ../libhtdig/os_finit.o ../libhtdig/os_fsync.o ../libhtdig/os_handle.o ../libhtdig/os_map.o ../libhtdig/os_method.o ../libhtdig/os_oflags.o ../libhtdig/os_open.o ../libhtdig/os_region.o ../libhtdig/os_rename.o ../libhtdig/os_root.o ../libhtdig/os_rpath.o ../libhtdig/os_rw.o ../libhtdig/os_seek.o ../libhtdig/os_sleep.o ../libhtdig/os_spin.o ../libhtdig/os_stat.o ../libhtdig/os_tmpdir.o ../libhtdig/os_unlink.o ../libhtdig/qam.o ../libhtdig/qam_auto.o ../libhtdig/qam_conv.o ../libhtdig/qam_method.o ../libhtdig/qam_open.o ../libhtdig/qam_rec.o ../libhtdig/qam_stat.o ../libhtdig/txn.o ../libhtdig/txn_auto.o ../libhtdig/txn_rec.o ../libhtdig/txn_region.o ../libhtdig/xa.o ../libhtdig/xa_db.o ../libhtdig/xa_map.o ../libhtdig/getcwd.o ../libhtdig/mhash_md5.o ../libhtdig/regex.o ../libhtdig/vsnprintf.o ../libhtdig/memcmp.o ../libhtdig/mktime.o ../libhtdig/snprintf.o ../libhtdig/memcpy.o ../libhtdig/myqsort.o ../libhtdig/strerror.o ../libhtdig/memmove.o ../libhtdig/raise.o ../libhtdig/timegm.o ../libhtdig/Configuration.o ../libhtdig/Database.o ../libhtdig/Dictionary.o ../libhtdig/DB2_db.o ../libhtdig/IntObject.o ../libhtdig/List.o ../libhtdig/Object.o ../libhtdig/ParsedString.o ../libhtdig/Queue.o ../libhtdig/QuotedStringList.o ../libhtdig/Stack.o ../libhtdig/String.o ../libhtdig/StringList.o ../libhtdig/StringMatch.o ../libhtdig/String_fmt.o ../libhtdig/good_strtok.o ../libhtdig/strcasecmp.o ../libhtdig/strptime.o ../libhtdig/HtCodec.o ../libhtdig/HtWordCodec.o ../libhtdig/HtVector.o ../libhtdig/HtHeap.o ../libhtdig/HtPack.o ../libhtdig/HtDateTime.o ../libhtdig/HtRegex.o ../libhtdig/HtRegexList.o ../libhtdig/HtRegexReplace.o ../libhtdig/HtRegexReplaceList.o ../libhtdig/HtVectorGeneric.o ../libhtdig/HtMaxMin.o ../libhtdig/HtWordType.o ../libhtdig/md5.o ../libhtdig/WordBitCompress.o ../libhtdig/WordContext.o ../libhtdig/WordCursor.o ../libhtdig/WordDB.o ../libhtdig/WordDBCompress.o ../libhtdig/WordDBInfo.o ../libhtdig/WordDBPage.o ../libhtdig/WordKey.o ../libhtdig/WordKeyInfo.o ../libhtdig/WordList.o ../libhtdig/WordMonitor.o ../libhtdig/WordRecord.o ../libhtdig/WordRecordInfo.o ../libhtdig/WordReference.o ../libhtdig/WordStat.o ../libhtdig/WordType.o ../libhtdig/DocumentDB.o ../libhtdig/DocumentRef.o ../libhtdig/HtWordReference.o ../libhtdig/HtWordList.o ../libhtdig/defaults.o ../libhtdig/HtURLCodec.o ../libhtdig/URL.o ../libhtdig/URLTrans.o ../libhtdig/HtZlibCodec.o ../libhtdig/cgi.o ../libhtdig/HtSGMLCodec.o ../libhtdig/HtConfiguration.o ../libhtdig/HtURLRewriter.o ../libhtdig/conf_lexer.o ../libhtdig/conf_parser.o ../libhtdig/Connection.o ../libhtdig/Transport.o ../libhtdig/HtHTTP.o ../libhtdig/HtFile.o ../libhtdig/HtNNTP.o ../libhtdig/HtCookie.o ../libhtdig/HtCookieJar.o ../libhtdig/HtCookieMemJar.o ../libhtdig/HtCookieInFileJar.o ../libhtdig/HtHTTPBasic.o ../libhtdig/HtHTTPSecure.o ../libhtdig/SSLConnection.o ../libhtdig/Document.o ../libhtdig/ExternalParser.o ../libhtdig/HTML.o ../libhtdig/Parsable.o ../libhtdig/Plaintext.o ../libhtdig/Retriever.o ../libhtdig/Server.o ../libhtdig/URLRef.o ../libhtdig/ExternalTransport.o ../libhtdig/Accents.o ../libhtdig/Endings.o ../libhtdig/EndingsDB.o ../libhtdig/Exact.o ../libhtdig/Fuzzy.o ../libhtdig/Metaphone.o ../libhtdig/Prefix.o ../libhtdig/Regexp.o ../libhtdig/Soundex.o ../libhtdig/Speling.o ../libhtdig/Substring.o ../libhtdig/SuffixEntry.o ../libhtdig/Synonym.o ../libhtdig/Collection.o ../libhtdig/DocMatch.o ../libhtdig/HtURLSeedScore.o ../libhtdig/HtFTP.o ../libhtdig/ResultList.o ../libhtdig/ResultMatch.o ../libhtdig/SplitMatches.o ../libhtdig/Template.o ../libhtdig/TemplateList.o ../libhtdig/WeightWord.o ../libhtdig/parser.o ../libhtdig/ResultFetch.o ../libhtdig/BasicDocument.o ../libhtdig/TextCollector.o ../libhtdig/IndexPurge.o ../libhtdig/libhtdig_htdig.o ../libhtdig/libhtdig_htmerge.o ../libhtdig/libhtdig_htfuzzy.o ../libhtdig/libhtdig_log.o ../libhtdig/libhtdig_htsearch.o ../libhtdig/filecopy.o '


ln -s ../libhtdig/libhtdig.so.$LIBHTDIG_VER libhtdig.so.$LIBHTDIG_VER

if [ `uname` = 'Linux' ]; then
    gcc -shared  htdigphp.lo $LIBHTDIG_OBJS -lstdc++ -Xlinker -h -Xlinker libhtdigphp.so.$LIBHTDIG_VER -o libhtdigphp.so.$LIBHTDIG_VER
    #gcc -shared  htdigphp.lo  /nfs/local/linux/lib/libhtdig.so.$LIBHTDIG_VER -lstdc++ -Xlinker -h -Xlinker libhtdigphp.so.$LIBHTDIG_VER -o libhtdigphp.so.$LIBHTDIG_VER

elif [ `uname` = 'SunOS' ]; then
    gcc -shared  htdigphp.lo $LIBHTDIG_OBJS -Xlinker -h -Xlinker libhtdigphp.so.$LIBHTDIG_VER -o libhtdigphp.so.$LIBHTDIG_VER
    #gcc -shared  htdigphp.lo  /nfs/local/sunos/lib/libhtdig.so.$LIBHTDIG_VER -Xlinker -h -Xlinker libhtdigphp.so.$LIBHTDIG_VER -o libhtdigphp.so.$LIBHTDIG_VER

fi

#gcc -shared -L../libhtdig htdigphp.lo-l $(LIBHTDIG_LIBRARY) -lstdc++  -Wl,-soname -Wl,libhtdigphp.so -o .libs/libhtdigphp.so

cp libhtdigphp.so.$LIBHTDIG_VER modules/.
#cp .libs/libhtdigphp.so modules/libhtdigphp.so

ldd modules/libhtdigphp.so.$LIBHTDIG_VER
