//
// Retriever.h
//
// $Id: Retriever.h,v 1.1.1.1 1997/02/03 17:11:06 turtle Exp $
//
// $Log: Retriever.h,v $
// Revision 1.1.1.1  1997/02/03 17:11:06  turtle
// Initial CVS
//
// Revision 1.1  1995/12/11 22:47:02  turtle
// This uses the backwards model of only parsing HTML
//
// Revision 1.0  1995/08/18 16:27:04  turtle
// Before change to use of Server class
//
//
#ifndef _Retriever_h_
#define _Retriever_h_

#include "DocumentRef.h"
#include "Images.h"
#include <Dictionary.h>
#include <Queue.h>
#include <List.h>

class URL;
class Document;
class URLRef;

class Retriever
{
public:
    //
    // Construction/Destruction
    //
    			Retriever();
    virtual		~Retriever();

    //
    // Getting it all started
    //
    void		Initial(char *url);
    void		Initial(List &list);
    void		Start();

    //
    // Report statistics about the parser
    //
    void		ReportStatistics(char *name);
	
    //
    // These are the callbacks that we need to write code for
    //
    void		got_word(char *word, int location, int heading);
    void		got_href(URL &url, char *description);
    void		got_title(char *title);
    void		got_head(char *head);
    void		got_anchor(char *anchor);
    void		got_image(char *src);
    void		got_meta_email(char *);
    void		got_meta_notification(char *);
    void		got_meta_subject(char *);

    //
    // Allow for the indexing of protected sites by using a
    // username/password
    //
	void		setUsernamePassword(char *credentials);
	
private:
    //
    // A hash to keep track of what we've seen
    //
    Dictionary		visited;
    
    URL			*base;
    String		current_title;
    String		current_head;
    int			current_id;
    DocumentRef		*current_ref;
    int			current_anchor_number;
    int			trackWords;
    int			n_links;
    Images		images;
    String		credentials;
	
    //
    // These are weights for the words.  The index is the heading level.
    //
    double		factor[11];
    int			currenthopcount;

    //
    // Some semi-constants...
    //
    int			max_hop_count;
	
    //
    // The list of server-specific information objects is indexed by
    // ip address and port number.  The list contains Server objects.
    //
    Dictionary		servers;

    //
    // For efficiency reasons, we will only use one document object which
    // we reuse.
    //
    Document		*doc;

    String		notFound;
    
    //
    // Helper routines
    //
    int			Need2Get(char *url);
    DocumentRef	*	GetRef(char *url);
    int			IsValidURL(char *url);
    void		RetrievedDocument(Document &, char *url, DocumentRef *ref);
    void		parse_url(URLRef &urlRef);
    void		got_redirect(char *, DocumentRef *);
    void		recordNotFound(char *url, char *referer, int reason);
};

#endif


