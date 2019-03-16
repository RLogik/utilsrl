#' @title standard.setup
#' @description Provides standard trailing.comma'd functions and enables via option a disabling of menu and sys.pause.
#' @export standard.setup
#'
#' @usage \code{standard.setup();}
#'
#' @param options character string vector. As per the definition of base::menu
#'
#' @examples \dontrun{
#'	options('utilsrl::silent'=TRUE);
#'	standard.setup();
#'	# will skip user interaction and return \code{0}:
#'	menu(c('Yes','No'), title='Proceed with script?');
#'	sys.pause(); # will skip user interaction proceed with code.
#'	sys.pause(1); # will still pause for 1s.
#'	console.log(tabs=0, 'My message.'); # will not display.
#'	console.log(tabs=0, silent.off=TRUE, 'My message.'); # will not display.
#'	console.log(tabs=0, silent.off=FALSE, 'My message.'); # will show.
#'	# reactivates menu, sys.pause, console.log, etc.
#'	options('utilsrl::silent'=FALSE);
#' }
#'
#' @keywords syntax rbettersyntax standard setup

standard.setup <- function() {
	c <- trailing.comma(base::c);
	list <- trailing.comma(base::list);
	menu <- function(...) {
		rsilent <- getOption('utilsrl::silent');
		if(!is.logical(rsilent)) rsilent <- FALSE;
		if(rsilent) {
			return(0);
		} else {
			args <- as.list(sys.call())[-1L];
			env <- parent.frame();
			do.call(utils::menu, args, envir=env);
		}
	};

	for(obj in ls(all=TRUE)) assign(obj, get(obj, envir=environment()), .GlobalEnv);
};
