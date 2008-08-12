var Messages = {
  lastMessageId: 0,
  lastRequestLastMessageId: 0,
  onComplete: function(request, transport, json) {
    this.extractMessages(json);
  },
  onFailure: function(request, transport, json) {
    this.extractMessages(json);
  },
  extractMessages: function(json) {
    for (msgClass in json) {
      msgsOfClass = typeof( json[msgClass] ) == 'string' ? new Array(json[msgClass]) : json[msgClass];
      for (var i = 0; i < msgsOfClass.length; i++) {
        this.displayMessage(msgClass, msgsOfClass[i]);
      }
	this.fadeMessage();
    }
    this.lastRequestLastMessageId = this.lastMessageId;
  },
 
  displayMessage: function(msgClass, msgText) {
    msgId = 'message-' + ++this.lastMessageId;
    liEl = document.createElement('li');
    liEl.setAttribute('id', msgId);
    liEl.setAttribute('class', msgClass);
    liEl.setAttribute('title', "Click to close.");
    liEl.setAttribute('onclick', 'Element.remove(this);');
    liEl.setAttribute('style', 'cursor: pointer;');
    liEl.appendChild( document.createTextNode(msgText) );
    $('messages').style.visibility = 'visible';
    $('messages').appendChild(liEl);
  },
  fadeMessage: function() {
      msgEls = $A( $('messages').getElementsByTagName('li') );
      for (var i = 0; i < msgEls.length; i++) {
	if(msgEls[i]) {
        	Effect.Fade(msgEls[i].id, { duration: 2.5} );
	}
      }
 }
};
Ajax.Responders.register(Messages);
