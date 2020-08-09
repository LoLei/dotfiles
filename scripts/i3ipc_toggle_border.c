/*
 * Change i3wm single window border style
 * Usable to bind to e.g. bindsym $mod+Shift+b
 */
#include <glib/gprintf.h>
#include <i3ipc-glib/i3ipc-glib.h>

gint main(gint argc, gchar *argv[]) {
  /*
   * Border types via input argument:
   * https://i3wm.org/docs/userguide.html#_changing_border_style
   * border normal|pixel|toggle [<n>]
   * border none
   */
  gchar *border_type = "";
  if (argc > 1) {
    border_type = argv[1];
  }

  i3ipcConnection *conn = i3ipc_connection_new(NULL, NULL);
  i3ipcCon *root = i3ipc_connection_get_tree(conn, NULL);
  i3ipcCon *focused = i3ipc_con_find_focused(root);

  gchar *focused_border = NULL;
  g_object_get(focused, "border", &focused_border, NULL);

  i3ipc_con_command(focused, g_strconcat("border ", border_type, NULL), NULL);

  return 0;
}
