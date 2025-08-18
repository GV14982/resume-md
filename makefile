OUTPUT_DIR := output
OUTPUTS := $(addprefix $(OUTPUT_DIR)/,resume.pdf resume.docx resume.html)
all: $(OUTPUTS)

output/resume.pdf: | $(OUTPUT_DIR) resume.md resume.css
	pandoc resume.md -o output/resume.pdf --css=resume.css --pdf-engine=weasyprint
output/resume.docx: | $(OUTPUT_DIR) resume.md resume.css
	pandoc resume.md -o output/resume.docx --css=resume.css --standalone
output/resume.html: | $(OUTPUT_DIR) resume.md resume.css
	pandoc resume.md -o output/resume.html --css=resume.css --standalone

$(OUTPUTDIR):
	mkdir $(OUTPUT_DIR)

clean: output/*
	rm -rf output/*
