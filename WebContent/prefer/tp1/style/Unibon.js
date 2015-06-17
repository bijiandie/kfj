if(typeof Unibon == "undefined") Unibon={};
if(typeof Unibon.Web == "undefined") Unibon.Web={};
if(typeof Unibon.Web.Main == "undefined") Unibon.Web.Main={};
if(typeof Unibon.Web.Main.Phone == "undefined") Unibon.Web.Main.Phone={};
if(typeof Unibon.Web.Main.Phone.Vote == "undefined") Unibon.Web.Main.Phone.Vote={};
if(typeof Unibon.Web.Main.Phone.Vote.Default == "undefined") Unibon.Web.Main.Phone.Vote.Default={};
Unibon.Web.Main.Phone.Vote.Default_class = function() {};
Object.extend(Unibon.Web.Main.Phone.Vote.Default_class.prototype, Object.extend(new AjaxPro.AjaxClass(), {
	DoLaud: function(openId, voteId, itemId, usign) {
		return this.invoke("DoLaud", {"openId":openId, "voteId":voteId, "itemId":itemId, "usign":usign}, this.DoLaud.getArguments().slice(4));
	},
	GetRank: function(voteId) {
		return this.invoke("GetRank", {"voteId":voteId}, this.GetRank.getArguments().slice(1));
	},
	GetUserVote: function(voteId, openId) {
		return this.invoke("GetUserVote", {"voteId":voteId, "openId":openId}, this.GetUserVote.getArguments().slice(2));
	},
	url: '/ajaxpro/Unibon.Web.Main.Phone.Vote.Default,Unibon.Web.Main.ashx'
}));
Unibon.Web.Main.Phone.Vote.Default = new Unibon.Web.Main.Phone.Vote.Default_class();

