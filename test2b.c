char * test (char *);
char * second (char *);

int first = 1;

main ()
 {
  register char *t asm ("t0");
  register int   v asm ("t1");
  t = test("ab");
  t = test("xy");
  t = second("12");
  v = strlen(t);
  return(v);
 }

char * second (x)
register char *x asm ("a0");
 {
  register char *t asm ("t0");
  t = test(x);
  return(t);
 }

strlen (x)
register char *x asm ("a0");
 {
  register char *t asm ("t0");
  for (t = x; *t; t++) ;
  return(t-x);
 }

char * test (x)
register char *x asm ("a0");
 {
  static char a[16];
  if (first)
   {
    a[0] = 0;
    first = 0;
   }
  strcat(a,x);
  return(a);
 }
