!function(e){e(["jquery"],function(e){return function(){function n(e,n,t){return c({type:m.error,iconClass:l().iconClasses.error,message:e,optionsOverride:t,title:n})}function t(e,n,t){return c({type:m.info,iconClass:l().iconClasses.info,message:e,optionsOverride:t,title:n})}function o(e){g=e}function i(e,n,t){return c({type:m.success,iconClass:l().iconClasses.success,message:e,optionsOverride:t,title:n})}function s(e,n,t){return c({type:m.warning,iconClass:l().iconClasses.warning,message:e,optionsOverride:t,title:n})}function a(n){var t=l();return f||u(t),n&&0===e(":focus",n).length?void n[t.hideMethod]({duration:t.hideDuration,easing:t.hideEasing,complete:function(){p(n)}}):void(f.children().length&&f[t.hideMethod]({duration:t.hideDuration,easing:t.hideEasing,complete:function(){f.remove()}}))}function r(){return{tapToDismiss:!0,toastClass:"toast",containerId:"toast-container",debug:!1,showMethod:"fadeIn",showDuration:300,showEasing:"swing",onShown:void 0,hideMethod:"fadeOut",hideDuration:1e3,hideEasing:"swing",onHidden:void 0,extendedTimeOut:1e3,iconClasses:{error:"toast-error",info:"toast-info",success:"toast-success",warning:"toast-warning"},iconClass:"toast-info",positionClass:"toast-top-right",timeOut:5e3,titleClass:"toast-title",messageClass:"toast-message",target:"body",closeHtml:"<button>&times;</button>",newestOnTop:!0}}function d(e){g&&g(e)}function c(n){function t(n){return!e(":focus",c).length||n?c[s.hideMethod]({duration:s.hideDuration,easing:s.hideEasing,complete:function(){p(c),s.onHidden&&s.onHidden(),w.state="hidden",w.endTime=new Date,d(w)}}):void 0}function o(){(s.timeOut>0||s.extendedTimeOut>0)&&(r=setTimeout(t,s.extendedTimeOut))}function i(){clearTimeout(r),c.stop(!0,!0)[s.showMethod]({duration:s.showDuration,easing:s.showEasing})}var s=l(),a=n.iconClass||s.iconClass;"undefined"!=typeof n.optionsOverride&&(s=e.extend(s,n.optionsOverride),a=n.optionsOverride.iconClass||a),h++,f=u(s);var r=null,c=e("<div/>"),g=e("<div/>"),m=e("<div/>"),C=e(s.closeHtml),w={toastId:h,state:"visible",startTime:new Date,options:s,map:n};return n.iconClass&&c.addClass(s.toastClass).addClass(a),n.title&&(g.append(n.title).addClass(s.titleClass),c.append(g)),n.message&&(m.append(n.message).addClass(s.messageClass),c.append(m)),s.closeButton&&(C.addClass("toast-close-button"),c.prepend(C)),c.hide(),s.newestOnTop?f.prepend(c):f.append(c),c[s.showMethod]({duration:s.showDuration,easing:s.showEasing,complete:s.onShown}),s.timeOut>0&&(r=setTimeout(t,s.timeOut)),c.hover(i,o),!s.onclick&&s.tapToDismiss&&c.click(t),s.closeButton&&C&&C.click(function(e){e.stopPropogation(),t(!0)}),s.onclick&&c.click(function(){s.onclick(),t()}),d(w),s.debug&&console&&console.log(w),c}function u(n){return n||(n=l()),f=e("#"+n.containerId),f.length?f:(f=e("<div/>").attr("id",n.containerId).addClass(n.positionClass),f.appendTo(e(n.target)),f)}function l(){return e.extend({},r(),C.options)}function p(e){f||(f=u()),e.is(":visible")||(e.remove(),e=null,0===f.children().length&&f.remove())}var f,g,h=0,m={error:"error",info:"info",success:"success",warning:"warning"},C={clear:a,error:n,getContainer:u,info:t,options:{},subscribe:o,success:i,version:"2.0.0",warning:s};return C}()})}("function"==typeof define&&define.amd?define:function(e,n){"undefined"!=typeof module&&module.exports?module.exports=n(require(e[0])):window.toastr=n(window.jQuery)});