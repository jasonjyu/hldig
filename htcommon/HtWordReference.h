//
// HtWordReference.h
//
// HtWordReference: Reference to a word, derived from WordReference and
//		    implementing explicit accessors.
//
// Part of the ht://Dig package   <http://www.htdig.org/>
// Copyright (c) 1995-2000 The ht://Dig Group
// For copyright details, see the file COPYING in your distribution
// or the GNU Public License version 2 or later
// <http://www.gnu.org/copyleft/gpl.html>
//
// $Id: HtWordReference.h,v 1.3 2002/02/01 22:49:28 ghutchis Exp $
//
#ifndef _HtWordReference_h_
#define _HtWordReference_h_

#include "WordReference.h"
#include <stdio.h>

//
// Flags
// 
#define FLAG_TEXT 0
#define FLAG_CAPITAL 1
#define FLAG_TITLE 2
#define FLAG_HEADING 4
#define FLAG_KEYWORDS 8
#define FLAG_DESCRIPTION 16
#define FLAG_AUTHOR 32
#define FLAG_LINK_TEXT 64
#define FLAG_URL 128
// The remainder are undefined

class HtWordReference : public WordReference
{
public:
	//
	// Construction/Destruction
	//
        HtWordReference()	{}
        HtWordReference(const String& key, const String& record) :
	  WordReference(key, record) { }
        HtWordReference(const String& word) :
	  WordReference(word) {	}
        HtWordReference(String word, unsigned int docid, unsigned int flags, unsigned int location, unsigned int anchor) {
	  Word(word);
	  DocID(docid);
	  Location(location);
	  Anchor(anchor);
	  Flags(flags);
	}

	~HtWordReference()	{}

	//
	// Accessors
	//
	String			Word() const { return key.GetWord(); }
	void			Word(const String& arg) { key.SetWord(arg); }
	unsigned int		DocID() const { return key.Get( 1 ); }
	void			DocID(const unsigned int arg) { key.Set( 1, arg); }
	unsigned int		Flags() const { return key.Get( 2 ); }
	void			Flags(const unsigned int arg) { key.Set( 2, arg); }
	unsigned int		Location() const { return key.Get( 3 ); }
	void			Location(const unsigned int arg) { key.Set( 3, arg); }
	unsigned int		Anchor() const { return record.info.data; }
	void			Anchor(const unsigned int arg) { record.info.data = arg; }

	//
	// Dumping/Loading
	//
	int			Dump(FILE *fl) const;
	static int		DumpHeader(FILE *fl);
	int			Load(const String& s);
	static int		LoadHeader(FILE *fl);
};


#endif


