// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import "./simple_toggle";
import "./custom/comment_toggle";

eagerLoadControllersFrom("controllers", application)
    