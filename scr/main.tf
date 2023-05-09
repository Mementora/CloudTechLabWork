module "course" {
    source = "./modules/dynamodb/eu-central-1"
    context = module.label.context
    name = "course"
}

module "author" {
    source = "./modules/dynamodb/eu-central-1"
    context = module.label.context
    name = "author"
}

module "lambda" {
    source = "./modules/lambda/eu-central-1"
    context = module.label.context
    name = "author"
    name_courses = "courses"
    table_author_name = module.author.table_name
    table_author_arn = module.author.table_arn
    table_courses_name = module.course.table_name
    table_courses_arn = module.course.table_arn
}