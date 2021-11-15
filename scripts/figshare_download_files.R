library(rfigshare)


# trate de correrlo sin correr la linea 6
#  si no lo deja tenes q hacer una cuenta en figshare y luego correr la siguiente linea
rfigshare::fs_auth()


dt1 <- rfigshare::fs_details("12988730")  
nms <- sapply(dt1$files, function(x) x$name)
ids <- sapply(dt1$files, function(x) x$id)



df_id <- data.frame(nms, ids)


folder <- "AQUI LA DIRECCION DE DONDE LOS QUIERE GUARDAR"

for(i in 1:5)
  download.file(url = paste0("https://ndownloader.figshare.com/files/", ids[i]), 
                destfile = file.path(folder, nms[i]))
