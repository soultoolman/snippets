#' 探针表达谱转基因表达谱
#' @param probe_exp 探针表达谱数据框
#' @param anno 平台注释文件数据框
#' @param gene_col 平台注释文件中哪一列是基因
#' @param FUN 当多个探针对应同一个基因时的处理方法
#' @return 基因表达谱数据框
probe2gene <- function (probe_exp, anno, gene_col, FUN) {
  gene_exp <- aggregate(
    probe_exp,
    by = list(
      gene=anno[rownames(probe_exp), gene_col]
    ),
    FUN = FUN
  )
  rownames(gene_exp) <- gene_exp$gene
  gene_exp$gene <- NULL
  gene_exp
}