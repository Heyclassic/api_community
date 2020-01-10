import { createMuiTheme } from "@material-ui/core/styles";
import indigo from "@material-ui/core/colors/indigo";
import amber from "@material-ui/core/colors/amber";

export default createMuiTheme({
  palette: {
    primary: amber,
    secondary: indigo, // Indigo is probably a good match with amber yellow
  },
});
