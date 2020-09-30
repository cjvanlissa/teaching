test_that("multiplication works", {
  tmp <- c("\t 48483 Options Menu: Username\tFirst\tLast\tfirstlast@students.uu.nl\tstudent\t\tYes")
  expect_error({read_bb(tmp)}, NA)
})
