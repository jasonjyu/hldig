//
// HtConfiguration.h
//
//             HtConfiguration: extends Configuration class
//             to implement Apache-style config. Uses parser
//             generated by Bison from conf_parser.yxx
//
// Part of the ht://Dig package   <http://www.htdig.org/>
// Copyright (c) 1995-2000 The ht://Dig Group
// For copyright details, see the file COPYING in your distribution
// or the GNU Public License version 2 or later
// <http://www.gnu.org/copyleft/gpl.html>
//
// $Id: HtConfiguration.h,v 1.3 2002/02/01 22:49:28 ghutchis Exp $
//


#ifndef	_HtConfiguration_h_
#define	_HtConfiguration_h_

#include"Configuration.h"
#include "ParsedString.h"
#include "URL.h"

class HtConfiguration : public Configuration
{
 public:
    const String	Find(const String& name) const {return(Configuration::Find(name));}
    int			Value(const String& name, int default_value = 0) const
      {return(Configuration::Value  (name,default_value));}
    double	Double(const String& name, double default_value = 0) const 
      {return(Configuration::Double (name,default_value));}
    int		Boolean(const String& name, int default_value = 0) const   
      {return(Configuration::Boolean(name,default_value));}
    void		Add(const String& str){Configuration::Add(str);}
    void		Add(const String& name, const String& value)
      {Configuration::Add(name,value);}
    void		AddParsed(const String& name, const String& value)
      {Configuration::AddParsed(name,value);}

    void		Add(const char *name, const char *value,
                           Configuration *aList);
    const String	Find(URL *aUrl, const char *value) const;
    const String	Find(const char *blockName, const char *name, const char *value) const;
    int		Value(const char *blockName, const char *name, const char *value,
                  int default_value = 0);
    double	Double(const char *blockName, const char *name, const char *value,
                  double default_value = 0);
    int		Boolean(const char *blockName, const char *name, const char *value,
                  int default_value = 0);
    int		Value(URL *aUrl,const char *value,int default_value = 0);
    double	Double(URL *aUrl,const char *value,double default_value = 0);
    int		Boolean(URL *aUrl,const char *value,int default_value = 0);
    inline
    String	ParseString(const char*) const;   // parse ${var} string
    String	getFileName() const { return FileName; }

    //
    // We need some way of reading in the database from a configuration file
    // ... this uses the parser
    virtual int         Read(const String& filename);

 protected:
    Dictionary          dcBlocks;
    Dictionary          dcUrls;
    String		FileName;	// config's file name

 public:
    HtConfiguration():Configuration()
	{;}

    HtConfiguration(const HtConfiguration& config) :
	Configuration(config),
	dcBlocks(config.dcBlocks),
	dcUrls(config.dcUrls)
	{
	    ;
	}

	static HtConfiguration* const config();

  private:
  	static HtConfiguration* _config;
};

//********************************************************************
//
inline
String HtConfiguration::ParseString(const char *str) const {
 return ParsedString(str).get(dcGlobalVars);
}

#endif


