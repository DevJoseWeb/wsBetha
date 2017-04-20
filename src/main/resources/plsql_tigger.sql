CREATE TRIGGER u_tg_insert_tb_b AFTER INSERT
ON public.tb_a FOR EACH ROW    
      EXECUTE PROCEDURE public.fn_insert_tb_b();


CREATE OR REPLACE FUNCTION public.fn_insert_tb_b()
  RETURNS trigger AS
$BODY$begin 
insert into public.tb_b (valor, numero, teste)
             values (new.valor, new.cod, new.valor);
        	return new;
    end; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.fn_insert_tb_b()
  OWNER TO postgres;
	

